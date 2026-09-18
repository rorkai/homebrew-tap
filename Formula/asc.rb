# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '5.4.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.4.0/asc_5.4.0_macOS_arm64'
      sha256 '191f2ece2baa3dab92d6094ce73fab62116ffc4d9e647b1fb70380e9faf15838'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/5.4.0/asc_5.4.0_macOS_amd64'
      sha256 'c56adc07b36d0403006d6896c3fdb066f3139708b8443950f9ff55df3bc9c9a5'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_5.4.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_5.4.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
