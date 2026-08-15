# typed: false
# frozen_string_literal: true

class Asc < Formula
  desc "A fast, AI-agent friendly CLI for App Store Connect"
  homepage 'https://github.com/rorkai/App-Store-Connect-CLI'
  version '4.4.0'
  license 'MIT'

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.4.0/asc_4.4.0_macOS_arm64'
      sha256 '806e19fcef633d7c95c558cedf603ec73aca50365aefaf14c58ff471ad9266c1'
    else
      url 'https://github.com/rorkai/App-Store-Connect-CLI/releases/download/4.4.0/asc_4.4.0_macOS_amd64'
      sha256 '5184f3125c3b091a7aa0558d0867682aef95a4ae10f09894ffa2d3f45f568ddc'
    end
  end

  def install
    if Hardware::CPU.arm?
      bin.install 'asc_4.4.0_macOS_arm64' => 'asc'
    else
      bin.install 'asc_4.4.0_macOS_amd64' => 'asc'
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/asc --version")
  end
end
