# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '6.4.1'
  license 'MIT'

  depends_on macos: :ventura

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/6.4.1/asc_6.4.1_macOS_arm64'
      sha256 '39039f562278dfca9cc801aee13ce08be4b06fdc97e7565e3f20bee757a7c975'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/6.4.1/asc_6.4.1_macOS_amd64'
      sha256 'd467ad13ddd3fe773e77b0bb1fc2cc7680c95c0593acb23f36ba4a53092afe58'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_6.4.1_macOS_arm64' => 'asc'
    else
      bin.install 'asc_6.4.1_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
